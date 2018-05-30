<#import "parts/common.ftl" as c>
<#import "parts/bigparalax.ftl" as p1>
<@c.page>

<div class="uk-grid-match uk-grid-small" uk-grid>


    <div class="uk-width-2-3@m uk-width-2-3@l">
        <div class="uk-card uk-card-default uk-card-body">
        </div>
    </div>
    <div class="uk-width-1-3@m uk-width-1-3@l">
        <div class="uk-card uk-card-default uk-card-body">
        </div>
    </div>
    <div class="uk-width-2-3@m uk-width-2-3@l">
        <div class="uk-card uk-card-default uk-card-body">
        </div>
    </div>
    <div class="uk-width-1-1@m uk-width-1-1@l">
        <div class="uk-card uk-card-default uk-card-body">
        </div>
    </div>
<#--Коментарии-->
    <div class="uk-width-1-1@m uk-width-1-1@l">
        <div class="uk-card uk-card-default uk-card-body">
            <ul class="uk-comment-list">
                <#list comment as msg>
                    <#if !msg.reply??>
                        <li>
                            <@message msg/>
                            <@treeView msg replyes/>
                        </li>
                    </#if>
                </#list>
            </ul>
        </div>
    </div>

</div>

    <#macro message msg>
    <article class="uk-comment <#if msg.reply??>uk-comment-primary</#if>">
        <header class="uk-comment-header uk-grid-medium uk-flex-middle" uk-grid>
            <div class="uk-grid-medium uk-flex-middle" uk-grid>
                <div class="uk-width-auto">
                    <img class="uk-comment-avatar" src="/img/${msg.author.avatar}" width="80" height="80" alt="">
                </div>
                <div class="uk-width-expand">
                    <h4 class="uk-comment-title uk-margin-remove"><a class="uk-link-reset" href="#">${msg.author.username}</a></h4>
                    <#--<p class="uk-comment-meta uk-margin-remove-top"><a class="uk-link-reset" href="#">12 days ago</a></p>-->
                </div>
            </div>
            <div class="uk-position-top-right uk-position-small uk-hidden-hover"><a class="uk-link-muted" href="#">Reply</a></div>
        </header>
        <div class="uk-comment-body">
            <#if msg.reply??>
                <i><span class="uk-label">${msg.author.username} answer ${msg.reply.author.username}</span></i>
                <p>${msg.message}</p>
                <#else>
                <p>${msg.message}</p>
            </#if>
        </div>
    </article>
    </#macro>
    <#macro treeView msg listReply>
        <#list listReply as reply>
            <#if reply.reply.toString() == msg.toString()>
        <ul>
            <li>
                <@message reply/>
                    <@treeView reply replyes/>
            </li>
        </ul>
            </#if>
        </#list>
    </#macro>
</@c.page>
