<#import "parts/common.ftl" as c>

<@c.page>
    <div class="input-group">
        <form class="" method="POST" name="add">
            <input type="text" name="name" class="form-control">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="button">Next >>></button>
        </form>
    </div>
</@c.page>