class NiceMessagesController < ApplicationController
  def index
    NiceMessageUpdater.update if NiceMessageUpdater.update_needed?

    session[:last_nice_message] = 0 unless session.key? :last_nice_message
    session[:last_nice_message] = (NiceMessages.next(session[:last_nice_message]).to_s)

    @niceMessage = NiceMessages.get(params[:id])
  end

  def next
    NiceMessageUpdater.update if NiceMessageUpdater.update_needed?

    session[:last_nice_message] = 0 unless session.key? :last_nice_message
    session[:last_nice_message] = (NiceMessages.next(session[:last_nice_message]).to_s)

    redirect_to action: :get, id: session[:last_nice_message], :status => 307
  end

  def get
    NiceMessageUpdater.update if NiceMessageUpdater.update_needed?

    niceMessage = NiceMessages.get(params[:id])

    render :json => niceMessage.to_json
  end
end
