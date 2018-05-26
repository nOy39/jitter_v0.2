<#import "parts/common.ftl" as c>

<@c.page>

    <h1>Error</h1>
    ${error?ifExists}
    ${status?ifExists}
    <p>Sorry the operation you tried to do is not supported</p>
    <span>Sorry the page url <a href="#">${url?ifExists}</a> </span>
    <p>Error message:</p><p>${exception.message?ifExists}</p>





</@c.page>
