<#import "parts/common.ftl" as c>
<@c.page>

<form method="post" action="/comment" name="comments">
    <fieldset class="uk-fieldset">

        <div class="uk-margin">
            <textarea class="uk-textarea" rows="5" placeholder="Textarea" name="comments"></textarea>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="hidden" name="commentReply" value="">
            <button class="uk-button uk-button-default" type="submit">Button</button>
        </div>

    </fieldset>
</form>
<ul>

    <#list comment as msg>
        <#if !msg.reply??>
            <li>
                ${msg.message}
                    <@treeView msg replyes/>
            </li>
        </#if>
    </#list>

<#macro treeView msg listReply>
    <#list listReply as reply>
        <#if reply.reply.toString() == msg.toString()>
        <ul>
            <li>
                ${reply.message}
                    <@treeView reply replyes/>
            </li>
        </ul>
        </#if>
    </#list>
</#macro>

<#--<#list comment as msg>-->
<#--<#if !msg.reply??>-->
<#--<li>-->
<#--${msg.message}-->
<#--<ul>-->
<#--<li>-->
<#--<#list replies as reply>-->
<#--<#if reply.reply.toString() == msg.toString()>-->
<#--${reply.message}-->
<#--<#list replies as sub_reply>-->
<#--<#if sub_reply.reply.toString() == reply.toString()>-->
<#--<ul>-->
<#--<li>-->
<#--${sub_reply.message}-->
<#--</li>-->
<#--</ul>-->
<#--</#if>-->
<#--</#list>-->
<#--</#if>-->

<#--</#list>-->
<#--</li>-->
<#--</ul>-->
<#--</li>-->
<#--</#if>-->
<#--</#list>-->
</ul>

<div class="uk-background-muted">
    <div class="uk-width uk-width-5-6@m  uk-width-5-6@l uk-background-blend-color">
ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    </div>
</div>
</@c.page>