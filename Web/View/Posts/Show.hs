module Web.View.Posts.Show where

import qualified Text.MMark as MMark
import Web.View.Prelude

data ShowView = ShowView {post :: Include "comments" Post}

instance View ShowView where
  html ShowView {..} =
    [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">Show Post</li>
            </ol>
        </nav>
        <h1>{get #title post}</h1>
        <p>Written: {get #createdAt post |> timeAgo}</p>
        <p>Published: {get #publishedAt post |> timeAgo}</p>
        <div>{get #body post |> renderMarkdown}</div>

        <a href={NewCommentAction (get #id post)}>Add Comment</a>
        <div>{forEach (get #comments post) renderComment}</div>
    |]

renderMarkdown text =
  case text |> MMark.parse "" of
    Left error -> "Something broke"
    Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml

renderComment :: Comment -> Html
renderComment comment =
  [hsx|
        <div class="mt-4">
            <h5>{get #author comment}</h5>
            <p>{get #body comment}</p>
        </div>
    |]
