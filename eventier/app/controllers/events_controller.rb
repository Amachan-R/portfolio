class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def search
    @events = Event.search(params[:search])
  end

  def index
    @events = Event.page(params[:page]).per(20).reverse_order
  end



  def show
    @event = Event.find(params[:id])
    @event_comment = EventComment.new

    # テストコードなので実際のデータを別途取得してください。
    ran = rand(1..3)
    if ran == 1
      @lat = 40.783
      @lon = -73.966
    elsif ran == 2
      @lat = 35.6585848
      @lon = 139.7432442
    else
      @lat = 48.8737952
      @lon = 2.2928388
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :image, :caption, :prefecture, :age, :created_at)
  end

end
