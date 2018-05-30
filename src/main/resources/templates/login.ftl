<#import "parts/common.ftl" as c>

<@c.page>
<div class="py-5 text-white opaque-overlay">
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 col-sm-6" style="background-size:cover;background-image: url('../static/img/50p.png');background-repeat:space">
                <h1 class="text-gray-dark text-light text-center text-uppercase">Jitter ToDo&nbsp;</h1>
                <p class="lead mb-4">Enter your username and password</p>
                <form class="" method="post" action="/login">
                    <div class="form-group">
                        <label>Email address</label>
                        <input type="text" name="username" class="form-control" placeholder="Enter your username"> </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Password"> </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn col-3 md-3 btn-outline-primary col-sm-3 col-md-3 col-lg-3 col-xl-3" style="background-image: url('../static/img/25p.png'); position:relative;top:-5px" id="send">Send</button>
                    <span style="float: right"><a href="/registration">Sign up</a>, new author.</span>
                </form>
            </div>
        </div>
    </div>
</div>
</@c.page>

