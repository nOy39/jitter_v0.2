<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">User Name :</label>
        <div class="col-sm-6">
            <input class="form-control" type="text" name="username"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password :</label>
        <div class="col-sm-6">
            <input class="form-control" type="password" name="password" placeholder="password"/>
        </div>
    </div>
    <#if isRegisterForm>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-6">
            <input class="form-control" type="email" name="email" placeholder="some@some.com"/>
        </div>
    </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <div class="form-group row">
        <button type="submit" class="btn btn-outline-primary">
            <#if isRegisterForm>Create
            <#else>Sign In
            </#if>
        </button>
    <#if !isRegisterForm>
        <a href="/registration" class="btn btn-outline-secondary ml-3">Registration</a>
    </#if>

    </div>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Log out</button>
</form>
</#macro>