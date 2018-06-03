<#import "parts/common.ftl" as c>
<#import "parts/bigparalax.ftl" as p1>
<#include "parts/security.ftl">
<@c.page>
<#--TODO Сделать Setting-->
<#--TODO Сделать лайки-->
<#--TODO сделать фронт.-->
<div class="uk-grid-match uk-grid-small" uk-grid xmlns="http://www.w3.org/1999/html">
<#--Центральный блок-->
    <div class="uk-width-2-3 uk-width-2-3@xl">
        <div class="uk-card uk-card-default uk-card-body">
        <#--TODO Оставляю такой вид LOCKED!!!-->
            <article class="uk-article">
                <h1 class="uk-article-title uk-text-uppercase"><a class="uk-link-reset" href="">${note.name}</a></h1>
                <hr class="uk-divider-icon">
                <#if note.description??>
                <p class= "uk-text-large">${note.description}</p>
                <#else>
                <p class= "uk-text-lead uk-text-muted">Description Empty</p>
                </#if>
                <hr class="uk-divider-icon uk-position-bottom uk-position-large">
                <p class="uk-article-meta uk-position-small uk-position-bottom-left"><a class="uk-text-primary" href="#modal-description" uk-toggle>Edit</a> description.</p>
                <p class="uk-article-meta uk-position-bottom-right uk-position-medium">Create by ${note.author.username} on ${note.createdDate}. Posted in <a class="uk-text-primary" href="#">${note.desk.name}</a></p>
            </article>
        </div>
    </div>
<#--Левый БЛОК-->
    <div class="uk-width-1-3 uk-width-1-3@xl">
        <div class="uk-card uk-card-default uk-card-body">
            <hr class="uk-divider-icon">
            <div>
                <button href="#modal-upload" class="uk-button uk-button-text uk-width-1-1" type="button" uk-toggle>Upload file</button>
            </div>
            <div class="uk-offcanvas-content">
                <button class="uk-button uk-button-text uk-width-1-1" type="button" uk-toggle="target: #offcanvas-flip">operate</button>
            </div>
            <div class="uk-offcanvas-content">
                <button class="uk-button uk-button-text uk-width-1-1" type="button" uk-toggle="target: #offcanvas-flip">History</button>
            </div>
            <div>
            <a href="#target" class="uk-button uk-button-text uk-width-1-1" uk-scroll>
                        <#if 0<count>
                            ${count} Comments</a>
                        <#else>
                            Comments</a>
                        </#if>
            </div>
            <hr class="uk-divider-icon">
            <div uk-lightbox>
                <#list images as image>
                    <a href="/img/notes/${image.filename}" data-caption="${image.originalName}">
                        ${image.originalName}
                    </a>
                    <#sep>,
                </#list>
            </div>

            <hr>
            <small>Total ${countFile} file uploaded.</small>
        </div>

    </div>
<#--СПИСОК КОМЕНТОВ-->
<#--TODO подумать как отображать коменты в стиле youtube, НЕ ДЕЛАТЬ ТУТ!!!-->
<#--TODO подумать как изенить форму ввода коментария, НЕ ДЕЛАТЬ ТУТ-->
    <div class="uk-width-2-3@m uk-width-2-3@l" id="target">
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
        <a href="#" uk-totop uk-scroll></a>
    </div>
    <div class="uk-width-1-3@m uk-width-1-3@l">
        <div class="uk-card uk-card-default uk-card-body">
            <hr class="uk-divider-icon">
            <form method="post" action="/notes/addtag" name="addTag">
                <input class="uk-input uk-form-blank uk-width-4-5" type="text" placeholder="Input tag" name="tag">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="hidden" name="note" value="${note.id}">
            </form>
            <hr>
            <div class="uk-grid-small uk-child-width-auto" uk-grid>
                <div>
                  <#list tags as tag>
                      <form action="/notes/${tag.id}" name="deleteTag" method="post">
                      <input type="hidden" name="_csrf" value="${_csrf.token}">
                      <button class="uk-button uk-button-text" type="submit"><span uk-icon="tag">${tag.name}</span></button><#sep >,
                      </form>
                  </#list>
                </div>
            </div>
        </div>
    </div>

</div>
<#-->-----------------------------------------------------------------------------------<-->
<#-->----------------------------------Модальные окна-----------------------------------<-->
<#-->-----------------------------------------------------------------------------------<-->
<#-->Выбираем Tag<-->
<#-->Добавление описания к ноте<-->
    <div id="modal-upload" uk-modal>
        <div class="uk-modal-dialog">
            <button class="uk-modal-close-default" type="button" uk-close></button>
            <div>
                <form method="post" enctype="multipart/form-data" action="/notes/upload">

                    <div class="uk-margin" uk-margin>
                        <div uk-form-custom="target: true">
                            <input type="file" name="file" id="customFile">
                            <input class="uk-input uk-form-width-auto" type="text" placeholder="Select file" disabled>
                            <input type="hidden" name="note" value="${note.id}">
                            <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        </div>
                        <button class="uk-button uk-button-default">Submit</button>
                    </div>
                </form>
            </div>
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

<#-->Загрузка файла описания к ноте<-->
    <div id="modal-upload" uk-modal>
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

<#--LOCKED!!! НЕ ТРОГАТЬ ТАМ НЕЧЕГО БРАТЬ, НЕЧЕГО ДОБАВЛЯТЬ-->
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
                <img class="uk-preserve-width uk-border-circle" src="/img/avatars/${msg.author.avatar?ifExists}" width="60" alt="">
            </td>
            <td class="uk-table-link">
                <ul class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
                        <li><a href="#">${msg.difference?ifExists}</a></li>
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
