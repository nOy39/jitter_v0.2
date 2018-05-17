<#import "../parts/common.ftl" as c>
<#import "../parts/registration.ftl" as r>
<#include "../parts/security.ftl">
<@c.page>
<div>
    <span>
      <h2>Hello, ${name?ifExists}!!!</h2>
    </span>
</div>

</@c.page>