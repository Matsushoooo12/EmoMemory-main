class Api::V1::Auth::SessionsController < ApplicationController
    def index
        user_list = {
            id: current_api_v1_user.id,
            name: current_api_v1_user.name,
            email: current_api_v1_user.email,
            emotion: current_api_v1_user.emotion,
            posts: current_api_v1_user.posts.map {|post| {id: post.id, content: post.content, emotion: post.emotion, likes: post.likes, created_at: post.created_at}},
            likes: current_api_v1_user.likes.where(post_id: Post.where(user_id: current_api_v1_user.id)).count + 1
        }
        if current_api_v1_user
            render json: {is_login: true, data: user_list }
        else
            render json: {is_login: false, message: "ユーザーが存在しません"}
        end
    end
end