<#import "parts/common.ftl" as c>
<#import "parts/bigparalax.ftl" as p1>
<@c.page>
<#--TODO Сделать Setting-->
<#--TODO Сделать лайки-->
<#--TODO сделать время последнего сообщения-->
<#--TODO сделать галерею загрузки-->
<div class="uk-grid-match uk-grid-small uk-text-center" uk-grid xmlns="http://www.w3.org/1999/html">
    <div class="uk-width-2-3 uk-width-2-3@xl">
        <div class="uk-card uk-card-default uk-card-body">
        <#--TODO Оставляю такой вид LOCKED!!!-->
            <article class="uk-article">

                <h1 class="uk-article-title"><a class="uk-link-reset" href="">${note.name}</a></h1>

                <p class="uk-article-meta">Written by ${note.author.username} on ${note.created}. Posted in <a class="uk-text-primary" href="#">${note.desk.name}</a></p>

            <#if note.description??>
            <p class= "uk-text-large">${note.description}</p>
            <p class="uk-article-meta"><a class="uk-text-primary" href="#modal-description" uk-toggle>Edit</a> description.</p>
            <#else>
            <p class= "uk-text-lead uk-text-muted">Description Empty</p>
            <p class="uk-article-meta "><a class="uk-text-primary" href="#modal-description" uk-toggle>Add</a> description.</p>
            </#if>
                <div class="uk-grid-small uk-child-width-auto" uk-grid>
                    <div>
                    <a href="#target" class="uk-button uk-button-text" uk-scroll>
                        <#if 0<count>
                            ${count} Comments</a>
                        <#else>
                            Comments</a>
                        </#if>
                        <a class="uk-button uk-button-text" href="#">Settings</a>
                    </div>
                    <form method="post" enctype="multipart/form-data" action="/notes/upload">

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
                                <input type="hidden" name="note" value="${note.id}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                            </div>
                            <button class="uk-button uk-button-default">Submit</button>
                        </div>
                    </form>

                </div>

            </article>
        </div>
    </div>
<#--TODO: Сделать норм контейнер для списка History-->
    <div class="uk-width-1-3 uk-width-1-3@xl">
        <div class="uk-card uk-card-default uk-card-body">
            <div class="uk-offcanvas-content">
                <button class="uk-button uk-button-text" type="button" uk-toggle="target: #offcanvas-flip">History</button>
            </div>
            <div class="uk-offcanvas-content">
                <form method="post" action="/notes/dateOperate">
                    <input type="date" name="date">
                <input type="hidden" name="note" value="${note.id}">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button class="uk-button uk-button-text" type="submit">вычислить дату</button>
                </form>
            </div>
        </div>

    </div>

    <div class="uk-width-1-1@m uk-width-1-1@l">
        <div class="uk-card uk-card-default uk-card-body">

            <div uk-lightbox>
                <#list images as image>
                    <a href="/img/notes/${image.filename}" data-caption="Caption">
                        ${image.originalName}
                    </a>
                    <#sep>,
                </#list>
            </div>
        </div>
    </div>

    <div class="uk-width-1-1@m uk-width-1-1@l" id="target">
        <div class="uk-card uk-card-default uk-card-body">
            <form method="post" action="/notes/comment">
                <div class="uk-overflow-auto" id="my-id">
                    <div class="uk-margin" uk-margin>
                        <input class="uk-input uk-form-blank uk-width-4-5" type="text" placeholder="Type here your text" name="comment">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="hidden" name="note" value="${note.id}">
                        <input type="hidden" name="commentId" value="0">
                        <button class="uk-button uk-button-default" type="submit">Send</button>
                    </div>
                </div>
            </form>
            <div class="uk-overflow-auto" id="my-id">
                <table class="uk-table uk-table-hover uk-table-middle uk-table-divider" beforescroll>
                    <thead>
                    <tr>
                        <th class="uk-table-shrink">Author</th>
                        <th class="uk-table-expand uk-text-center">Message</th>
                    </tr>
                    </thead>
                    <tbody>
                <#list comment as msg>
                    <#if !msg.reply??>
                        <@message msg/>
                        <@treeView msg replies/>
                    </#if>
                </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <a href="#" uk-totop uk-scroll></a>
</div>
<#-->-----------------------------------------------------------------------------------<-->
<#-->----------------------------------Модальные окна-----------------------------------<-->
<#-->-----------------------------------------------------------------------------------<-->

<#-->Добавление описания к ноте<-->
    <div id="modal-description" uk-modal>
        <div class="uk-modal-dialog">
            <button class="uk-modal-close-default" type="button" uk-close></button>
            <form method="post" action="/notes/description">
                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Description note</h2>
                </div>
                <div class="uk-modal-body">
                    <textarea class="uk-textarea" rows="8" name="description" placeholder="${note.description?ifExists}"></textarea>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="hidden" name="note" value="${note.id}">
                </div>
                <div class="uk-modal-footer uk-text-right">
                    <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                    <button class="uk-button uk-button-primary" type="submit">Save</button>
            </form>
        </div>
    </div>

<#-->Коментарии<-->
    <div id="modal-coment" uk-modal>
        <div class="uk-modal-dialog">
            <button class="uk-modal-close-default" type="button" uk-close></button>
            <form method="post" action="/notes/reply">
                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Comment note</h2>
                </div>
                <div class="uk-modal-body">
                    <textarea class="uk-textarea" rows="8" name="message" placeholder=""></textarea>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="hidden" name="note" value="${note.id}">
                </div>
                <div class="uk-modal-footer uk-text-right">
                    <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                    <button class="uk-button uk-button-primary" type="submit">Submit</button>
            </form>
        </div>
    </div>

<#-->История<-->
<div id="offcanvas-flip" uk-offcanvas="flip: true; overlay: true">
    <div class="uk-offcanvas-bar">
        <button class="uk-offcanvas-close" type="button" uk-close></button>
        <dl class="uk-description-list uk-description-list-divider">
            <#list histories as history>
                <dt class="text-light"><u><b>${history.note.name}</b></u></dt>
                <dd>${history.message}</dd>
                <dd><u><small>${history.author.username} at ${history.created}</small></u></dd>
            </#list>
        </dl>
    </div>
</div>
<#-->-----------------------------------------------------------------------------------<-->
<#-->------------------------------------ Макросы---------------------------------------<-->
<#-->-----------------------------------------------------------------------------------<-->

<#-->Макрос рекурсии<-->
    <#macro treeView msg listReply>
    <div id="modal-reply-${msg.id}" uk-modal>
        <div class="uk-modal-dialog">
            <button class="uk-modal-close-default" type="button" uk-close></button>
            <form method="post" action="/notes/comment">
                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Reply to ${msg.author.username}</h2>
                </div>
                <div class="uk-modal-body">
                    <textarea class="uk-textarea" rows="8" name="comment" placeholder=""></textarea>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="hidden" name="note" value="${note.id}">
                    <input type="hidden" name="commentId" value="${msg.id}">
                </div>
                <div class="uk-modal-footer uk-text-right">
                    <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                    <button class="uk-button uk-button-primary" type="submit">Submit</button>
            </form>
        </div>
    </div>
        <#list listReply as reply>
            <#if reply.reply.toString() == msg.toString()>
                <@message reply/>
                <@treeView reply replies/>
            </#if>
        </#list>
    </#macro>

<#-->Макрос построения таблицы сообщений<-->
    <#macro message msg>
        <tr>
            <td>
                <p class="uk-text-center">${msg.author.username}</p>
                <img class="uk-preserve-width uk-border-circle" src="/img/avatars/${msg.author.avatar}" width="60" alt="">
            </td>
            <td class="uk-table-link">
                <ul class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
                    <li><a href="#">12 days ago</a></li>
                    <li><a href="#modal-reply-${msg.id}" uk-toggle>Reply</a></li>
                </ul>
                <#if msg.reply??>
                    <p class="uk-article-meta">
                        <span class="uk-label">${msg.reply.author.username} write:</span>
                        <i>${msg.reply.message}</i>
                    </p>

                    <p class="uk-text-large uk-margin-small">${msg.message}</p>


                <#else>
                <p class="uk-text-large uk-margin-small">${msg.message}</p>
                </#if>

            </td>
        </tr>
    </#macro>
    <a href="" uk-totop></a>
</@c.page>
