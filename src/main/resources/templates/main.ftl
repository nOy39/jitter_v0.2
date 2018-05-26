<#import "parts/common.ftl" as c>

<@c.page>

<div class="container-fluid text-center">
    <div class="row content">

        <a href="/projects" class="btn-outline-primary">User projects</a>

        <a href="/projects/add" class="btn-outline-primary">Add projects</a>

        <form method="post" enctype="multipart/form-data">

            <div class="uk-margin">
                <span class="uk-text-middle">Here is a text</span>
                <div uk-form-custom>
                    <input type="file">
                    <span class="uk-link">upload</span>
                </div>
            </div>

            <div class="uk-margin" uk-margin>
                <div uk-form-custom="target: true">
                    <input type="file" name="file" id="customFile">
                    <input class="uk-input uk-form-width-medium" type="text" placeholder="Select file" disabled>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                </div>
                <button class="uk-button uk-button-default">Submit</button>
            </div>
        </form>


        <fieldset class="uk-fieldset">


    </div>
</div>

<form method="post" action="/comment">
    <div class="uk-grid-match uk-grid-small" uk-grid>
        <div class="uk-width-1-1@m uk-width-1-1@l">
            <div class="uk-card uk-card-default uk-card-body">
                <div class="uk-margin">
                    <span>Description:</span>
                    <textarea class="uk-textarea" id="comment-field" rows="5" placeholder="" name="textarea"></textarea>

                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn col-3 md-3 btn-outline-primary col-sm-3 col-md-3 col-lg-3 col-xl-3" style="background-image: url('../static/img/25p.png'); position:relative;top:-5px" id="send">Send</button>
                </div>
                <ul class="uk-comment-list">
                    <li>
                        <#list comments as comment>
                        <article class="uk-comment uk-comment-primary">
                            <header class="uk-comment-header uk-position-relative">
                                <div class="uk-grid-medium uk-flex-middle" uk-grid>
                                    <div class="uk-width-auto">
                                        <img class="uk-comment-avatar" src="/img/${comment.user.avatar?ifExists}" width="80" height="80" alt="">
                                    </div>
                                    <div class="uk-width-expand">
                                        <h4 class="uk-comment-title uk-margin-remove"><a class="uk-link-reset" href="#">${comment.user.getUsername()?ifExists}</a></h4>
                                        <p class="uk-comment-meta uk-margin-remove-top"><a class="uk-link-reset" href="#">12 days ago</a></p>
                                    </div>
                                </div>
                                <div class="uk-position-top-right uk-position-small uk-hidden-hover"><a class="uk-link-muted" href="#comment-field">Reply</a></div>
                            </header>
                            <div class="uk-comment-body">
                            <p>${comment.message}</p>
                            </div>
                        </article>
                        <br>
                        </#list>

                        <ul>
                            <li>
                                <article class="uk-comment uk-comment-primary uk-visible-toggle">
                                    <header class="uk-comment-header uk-position-relative">
                                        <div class="uk-grid-medium uk-flex-middle" uk-grid>
                                            <div class="uk-width-auto">
                                                <img class="uk-comment-avatar" src="/static/img/avatar/admin.gif" width="80" height="80" alt="">
                                            </div>
                                            <div class="uk-width-expand">
                                                <h4 class="uk-comment-title uk-margin-remove"><a class="uk-link-reset" href="#">Author</a></h4>
                                                <p class="uk-comment-meta uk-margin-remove-top"><a class="uk-link-reset" href="#">12 days ago</a></p>
                                            </div>
                                        </div>
                                        <div class="uk-position-top-right uk-position-small uk-hidden-hover"><a class="uk-link-muted" href="#">Reply</a></div>
                                    </header>
                                    <div class="uk-comment-body">
                                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
                                    </div>
                                </article>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</form>

</@c.page>
