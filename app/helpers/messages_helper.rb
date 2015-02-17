module MessagesHelper

  def user_messages( user )
    Message.all.where( "author_id = #{user.id} OR receiver_id = #{user.id}".order( "created_at" ) )
  end

end
