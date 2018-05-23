<#macro img src extra...>
  <img src="/myapp${src?ensure_starts_with('/')}"
    <#list extra as attrName, attrVal>
        ${attrName}="${attrVal}"
    </#list>
  >
</#macro>
<@img src="/images/test.png" width=100 height=50 alt="Test"/>

<#macro color>

</#macro>