<#import "parts/common.ftl" as c>
<#import "parts/leftside.ftl" as left>

<@c.page>

<div class="container-fluid text-center">
    <div class="row content">
        <@left.page>
                <a href="/projects" class="btn-outline-primary">User projects</a>

            <a href="/projects/add" class="btn-outline-primary">Add projects</a>

            <form action="post" name="form">
                <input type="submit" class="btn-outline-primary" placeholder="Create New Desk">
            </form>
            <form action="post" name="form">
                <input type="submit" class="btn-outline-primary" placeholder="Create New Desk">
            </form>
            <form action="post" name="form">
                <input type="submit" class="btn-outline-primary" placeholder="Create New Desk">
            </form>
        </@left.page>
        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-2 sidenav">
                    <p><a href="#">Link</a></p>
                    <p><a href="#">Link</a></p>
                    <p><a href="#">Link</a></p>
                </div>
                <div class="col-sm-8 text-left">
                    <h1>Welcome</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    <hr>
                    <h3>Test</h3>
                    <p>Lorem ipsum...</p>
                </div>
                <div class="col-sm-2 sidenav">
                    <div class="well">
                        <p>ADS</p>
                    </div>
                    <div class="well">
                        <p>ADS</p>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>

<footer class="container-fluid text-center">
    <p>Footer Text</p>
</footer>
</@c.page>
