<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">User Name:</label>
        <div class="col-sm-4">
            <input class="form-control" type="text" name="username"/>
        </div>
    </div>
    <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">First Name:</label>
            <div class="col-sm-4">
                <input class="form-control" type="text" name="username"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Last Name:</label>
            <div class="col-sm-4">
                <input class="form-control" type="text" name="username"/>
            </div>
        </div>
    </#if>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password:</label>
        <div class="col-sm-4">
            <input class="form-control" type="password" name="password" placeholder="password"/>
        </div>
    </div>
    <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Confirm password:</label>
            <div class="col-sm-4">
                <input class="form-control" type="password" name="password" placeholder="password"/>
            </div>
        </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-4">
            <input class="form-control" type="email" name="email" placeholder="some@some.com"/>
        </div>
    </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <div class="form-group row">
        <button type="submit" class="btn btn-outline-primary  col-sm-6">
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
<style>
    /* Add a dark gray background color to the modal header and center text */
    .modal-header, h4, .close {
        background-color: #333;
        color: #fff !important;
        text-align: center;
        font-size: 30px;
    }

    .modal-header, .modal-body {
        padding: 40px 50px;
    }
</style>

<!-- Used to open the Modal -->
<button class="btn" data-toggle="modal" data-target="#myModal">Login</button>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4><span class="glyphicon glyphicon-lock"></span> Tickets</h4>
            </div>
            <div class="modal-body">
                <form role="form" action="/login" method="post">
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
                        <input type="text" class="form-control" id="usrname" placeholder="Enter your username...">
                    </div>
                    <#--<div class="form-group">-->
                        <#--<label for="psw"><span class="glyphicon glyphicon-shopping-cart"></span>Enter your username</label>-->
                        <#--<input type="number" class="form-control" id="psw" placeholder="How many?">-->
                    <#--</div>-->
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Send To</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter your password...">
                    </div>
                    <button type="submit" class="btn btn-block">Enter
                        <span class="glyphicon glyphicon-ok"></span>
                    </button>
                <#--<@r.page>-->
                <#---->
                <#--</@r.page>-->
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span> Cancel
                </button>
                <p>You need <a href="/registration">registration?</a></p>
            </div>
        </div>
    </div>
</div>
</#macro>