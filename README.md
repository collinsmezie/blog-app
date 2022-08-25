![](https://img.shields.io/badge/Microverse-blueviolet)
# Blog App
This is a Catalog of things created with Ruby
### Description
A fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts. Built with Ruby on Rails.
### Cloning the project
 git clone git@github.com:collinsmezie/blog-app.git<Your-Build-Directory>
```
- cd Blog-app
rails s
```
## Built with
- Ruby on Rails
- PostgreSQL
## Prerequisites
Vscode or anyother
Setup
## Install
    Ruby
    Rails
## Run tests
    Run bundle install
    Run rubocop
## Author
:bust_in_silhouette: **Collins mezie**
- GitHub: [collinsmezie](https://github.com/collinsmezie/blog-app)
- LinkedIn: [collinsmezie](https://www.linkedin.com/in/collinsmezie/)
## :handshake: Contributing
Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](https://github.com/collinsmezie/blog-app/issues).
## Show your support
Give a :star:️ if you like this project!
## :memo: License

 it 'I can see the first comments on a post' do
        visit users_path
        first(".user-link").click
        first(".link").click
        @posts.each do |post|
            post.first_comment.each do |comment|
                expect(page).to have_content(comment.text)
            end 
        end 
    end

     user_post = @user.first_three_posts
        user_post.each do |post|
         expect(page).to have_content(post.title)
         expect(page).to have_content(post.text)
        end