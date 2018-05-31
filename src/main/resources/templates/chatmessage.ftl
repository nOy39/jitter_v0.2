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


    <div class="uk-container uk-container-center">
        <ul class="uk-tab" data-uk-tab="{connect:'#my-id'}">
            <li><a href="">Setting</a></li>
            <li><a href="">Tab 2</a></li>
            <li><a href="">Tab 3</a></li>
        </ul>
        <ul id="my-id" class="uk-switcher uk-margin">
            <li><a href="#" id="autoplayer" data-uk-switcher-item="next"></a>
                This slide contains a hidden link, that selects the next slide when clicked. The click is simulated by jacascript to mimic autoplay.
            </li>
            <li>Content 2</li>
            <li>Content 3</li>
        </ul>
    </div>
</@c.page>