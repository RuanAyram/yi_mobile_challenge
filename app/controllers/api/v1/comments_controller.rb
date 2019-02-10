# frozen_string_literal: true

class Api::V1::CommentsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]

  # GET /api/v1/comments
  def index
    @comments = if params[:flagged] == 'true'
                  Comment.flagged
                else
                  Comment.all
                end
    render json: { comments: @comments, status: :ok }
  end

  # GET /api/v1/comments/1
  def show
    render json: { comment: @comment, status: :ok }
  end

  # POST /api/v1/comments
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/comments/1
  def update
    if @comment.update(comment_params)
      render json: { comment: @comment, status: :ok }
    else
      render json: { comment_error: @comment.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /api/v1/comments/1
  def destroy
    @comment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @comment = Comment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:text, :user_id, :event_id, :flagged)
  end
end
