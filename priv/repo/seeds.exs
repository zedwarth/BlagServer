# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Blog.Repo
alias Blog.Accounts.User
alias Blog.Content.Post

add_user = &(%User{username: &1} |> Repo.insert!())
make_post = &(%Post{title: &1, body: &2})
add_post = &(&2 |> Ecto.build_assoc(:posts, &1) |> Repo.insert!())

mario =  add_user.("mario64")
mario_posts = [ 
  make_post.("Where the fuck is Peach?!", "Okay, this is getting ridicoulous! I don't have time for this!"),
  make_post.("Fuck Banks","Well, I hope you're all happy. The bank just forclosed on the family plumbing bussiness.")
]
Enum.each(mario_posts, &add_post.(&1, mario))

bowser = add_user.("KingKupa")
bowser_posts = [
  %Post{
    title: "Peach is a Whore",
    body: "She's fucking all those toads you know."
  },
  %Post{
    title: "Peach 4 Life",
    body: "Okay, I'll give it one more chance."
  }
]
Enum.each(bowser_posts, &add_post.(&1, bowser))
