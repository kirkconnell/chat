class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  def index
    if params[:room_id].nil?
      @messages = Message.all
      respond_to do |format|
        format.html
        format.xml  { render :xml => @messages }
      end
    else
      @room = Room.find params[:room_id]
      @messages = Message.find_latest(params[:room_id], params[:folk_id])
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @message }
    end
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.xml  { head :ok }
    end
  end
end
