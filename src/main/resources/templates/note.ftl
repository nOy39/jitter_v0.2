<#import "parts/common.ftl" as c>
<#import "parts/bigparalax.ftl" as p1>
<@c.page>

<div class="uk-grid-match uk-grid-small" uk-grid>

<#--ШАПКА-->
    <div class="uk-width-1-1@m uk-width-1-1@l">
        <div class="uk-card uk-card-default uk-card-body">
            <form>

                <input class="uk-input uk-form-blank uk-form-width-large uk-text-lead uk-position-small uk-position-left"
                       type="text" placeholder="${note.name}">

                <div>
                    <span class="uk-text-small uk-text-lowercase">in a <a href="#modal-move" uk-toggle>${note.desk.getName()}  desk.</a></span>
                </div>

                <label><input class="uk-radio" type="radio" name="radio2" checked> default</label>
                <label><input class="uk-radio" type="radio" name="radio2"> primary</label>
                <label><input class="uk-radio" type="radio" name="radio2"> secondary</label>


            </form>
        </div>
    </div>


<#--ТЕЛО-->
<#--Левая половина-->
    <div class="uk-width-2-3@m uk-width-2-3@l">

        <div class="uk-card uk-card-default uk-card-body">
        <#--Добавления описания-->
            <form method="post" enctype="multipart/form-data" name="">
                <div class="uk-margin">
                    <span>Description:</span>
                    <textarea class="uk-textarea" rows="5" name="description" placeholder="${note.description?ifExists}"></textarea>
                </div>
                <div class="uk-margin">
                    <div class="uk-margin" uk-margin>
                        <div uk-form-custom="target: true">
                            <input type="file" name="file" id="customFile">
                            <input class="uk-input uk-form-width-medium" type="text" placeholder="Select file" disabled>
                        </div>

                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="uk-button uk-button-default">Submit</button>
            </form>

        </div>
    </div>
<#--Правая половина-->
    <div class="uk-width-1-3@m uk-width-1-3@l">

        <div class="uk-card uk-card-default uk-card-body">
            <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom">Invite member</button>
            <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom">Tags</button>
            <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom">Deadline</button>
            <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom" type="button" uk-toggle="target: #modal-comments">Comments</button>
            <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom">Move notes</button>
            <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom">Send notes</button>
            <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom">Subscrite setting</button>
            <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom">Text</button>
            <button class="uk-button uk-button-text uk-width-1-1 uk-margin-small-bottom">Text</button>
        </div>
    </div>
<#--Препросмотр изображений-->
<#if image??>

    <div class="uk-width-1-1@m uk-width-1-1@l"uk-slider>

        <div class="uk-position-relative">

            <div class="uk-slider-container uk-light">
                <ul class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m">
                    <#list image as img>
                        <li>
                            <img src="/img/${img.filename}" alt="">
                            <div class="uk-position-center uk-panel"><h1>${img.originalName?ifExists}</h1></div>
                        </li>
                    </#list>
                </ul>
            </div>

            <div class="uk-hidden@s uk-light">
                <a class="uk-position-center-left uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                <a class="uk-position-center-right uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
            </div>

            <div class="uk-visible@s">
                <a class="uk-position-center-left-out uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                <a class="uk-position-center-right-out uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
            </div>

        </div>

        <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul>

    </div>

<div id="modal-comments" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <h2 class="uk-modal-title">Comments notes</h2>
        <p class="uk-text-right">
        <form method="post" action="/notes/comment">
            <textarea class="uk-textarea" id="comment-field" rows="4" placeholder="" name="textarea"></textarea>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="note" value="${note.id}"/>
            <input type="hidden" name="commentId" value="no reply">
            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
            <button class="uk-button uk-button-primary" type="submit">Save</button>
        </form>
        </p>
    </div>
</div>
<#---->
<#--<div class="uk-card uk-card-default uk-card-body">-->
<#--<div class="uk-position-relative uk-visible-toggle uk-light" uk-slider="center: true">-->

<#--<ul class="uk-slider-items uk-grid">-->
<#--<#list image as img>-->
<#--<li class="uk-width-3-4">-->
<#--<div class="uk-panel">-->
<#--<img src="/img/${img.filename}">-->
<#--<div class="uk-position-center uk-panel"><h1>${img.originalName?ifExists}</h1></div>-->
<#--</div>-->
<#--</li>-->
<#--</#list>-->

<#--<a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>-->
<#--<a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>-->

<#--</div>-->
<#--</div>-->
<#--</div>-->
</#if>
<#--ЖОПА-->
<#--Коментирование-->
    <#if comments??>
    <div class="uk-width-1-1@m uk-width-1-1@l">
        <div class="uk-card uk-card-default uk-card-body">
            <ul class="uk-comment-list">
                <li>
                    <#list comments as comment>
                    <article class="uk-comment uk-comment-primary uk-visible-toggle">
                        <header class="uk-comment-header uk-position-relative">
                            <div class="uk-grid-medium uk-flex-middle" uk-grid>
                                <div class="uk-width-auto">
                                    <img class="uk-comment-avatar" src="/static/img/avatar/admin.gif" width="80" height="80" alt="">
                                </div>
                                <div class="uk-width-expand">
                                    <h4 class="uk-comment-title uk-margin-remove"><a class="uk-link-reset" href="#">${comment.user.getUsername()?ifExists}</a></h4>
                                    <p class="uk-comment-meta uk-margin-remove-top"><a class="uk-link-reset" href="#">12 days ago</a></p>
                                </div>
                            </div>
                            <div class="uk-position-top-right uk-position-small uk-hidden-hover">
                                <a class="uk-link-muted" uk-toggle="target: #modal-reply-${comment.id}">Reply</a>
                            </div>
                        </header>
                        <div class="uk-comment-body">
                            <p>${comment.message?ifExists}</p>
                        </div>
                    </article>

                        <br>
                        <!-- Модальное окно коментирования -->

                        <!-- Модальное окно ответа -->
                        <div id="modal-reply-${comment.id}" uk-modal>
                            <div class="uk-modal-dialog uk-modal-body">
                                <h2 class="uk-modal-title">Reply comments</h2>
                                <p class="uk-text-right">
                                <form method="post" action="/notes/comment">
                                    <textarea class="uk-textarea" id="comment-field" rows="4" placeholder="" name="textarea"></textarea>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <input type="hidden" name="note" value="${note.id}"/>
                                <input type="hidden" name="commentId" value="${comment.getId()}">
                                    <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                                    <button class="uk-button uk-button-primary" type="submit">Save</button>
                                </form>
                                </p>
                            </div>
                        </div>


                    </#list>
                </li>
            </ul>

        </div>
    </div>
    </#if>
</div>


</@c.page>



