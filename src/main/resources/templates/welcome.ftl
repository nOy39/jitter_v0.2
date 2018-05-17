<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
<div>
    <span>
      <h2>Hello, ${name?ifExists}!!!</h2>
    </span>
</div>
    <#list notes as note>
    <div>
        <p class="text-${note.done?string("mutted","primary")}">
            ${note.done?string("<del>","")}
            ${note.id},
            ${note.message},
            ${note.date},
        <#--${note.done},-->
        <#--${note.author}-->
            <label>
                <input type="checkbox" name="${note}" ${note.done?string("checked","")}>,
            </label>
        </p>
        </del>
    </div>
    </#list>
</@c.page>