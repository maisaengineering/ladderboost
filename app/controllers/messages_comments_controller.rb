class MessagesCommentsController < ApplicationController
  # GET /messages_comments
  # GET /messages_comments.json
  def index
    @messages_comments = MessagesComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages_comments }
    end
  end

  # GET /messages_comments/1
  # GET /messages_comments/1.json
  def show
    @messages_comment = MessagesComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @messages_comment }
    end
  end

  # GET /messages_comments/new
  # GET /messages_comments/new.json
  def new
    @messages_comment = MessagesComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @messages_comment }
    end
  end

  # GET /messages_comments/1/edit
  def edit
    @messages_comment = MessagesComment.find(params[:id])
  end

  # POST /messages_comments
  # POST /messages_comments.json
  def create
    @messages_comment = MessagesComment.new(params[:messages_comment])

    respond_to do |format|
      if @messages_comment.save
        format.html { redirect_to @messages_comment, notice: 'Messages comment was successfully created.' }
        format.json { render json: @messages_comment, status: :created, location: @messages_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @messages_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages_comments/1
  # PUT /messages_comments/1.json
  def update
    @messages_comment = MessagesComment.find(params[:id])

    respond_to do |format|
      if @messages_comment.update_attributes(params[:messages_comment])
        format.html { redirect_to @messages_comment, notice: 'Messages comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @messages_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages_comments/1
  # DELETE /messages_comments/1.json
  def destroy
    @messages_comment = MessagesComment.find(params[:id])
    @messages_comment.destroy

    respond_to do |format|
      format.html { redirect_to messages_comments_url }
      format.json { head :no_content }
    end
  end
end
