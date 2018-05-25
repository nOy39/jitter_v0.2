<#import "common.ftl" as c>

<@c.page>
<div id="page">
    <h1>Error</h1>

    <p>Sorry the operation you tried to do is not supported</p>

    <p>Error message:</p>

    <p>${status} ${error}</p>
</div>
</@c.page>