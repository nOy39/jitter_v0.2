<#import "parts/common.ftl" as c>
<@c.page>
<#list projects as project>
<div>
    <span>${project.id}</span>
    <i>${project.prj_name}</i>
</div>
</#list>
</@c.page>