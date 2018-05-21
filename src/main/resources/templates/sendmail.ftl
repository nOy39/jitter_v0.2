<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
  <div class="py-5 text-white" style="background-image: url('static/img/50p.png');" >
      <div class="container">
          <div class="row">
              <div class="col-md-6"></div>
              <div class="col-md-6">
                  <h1>${message?ifExists}</h1>
                  <h1>Contact us</h1>
                  <p>We would love to hear from you</p>
                  <form action="send" method="post">
                      <div class="form-group">
                          <label for="InputName">Your name</label>
                          <input type="text" class="form-control" name="name" placeholder="Your name"> </div>
                      <div class="form-group">
                          <label for="InputEmail1">Email address</label>
                          <input type="email" class="form-control" name="email" " placeholder="Enter email"> </div>
                      <div class="form-group">
                          <label for="Textarea">Write here</label>
                          <textarea class="form-control" name="msg" rows="3" placeholder="Type here"></textarea>
                          <input type="hidden" name="_csrf" value="${_csrf.token}">
                      </div>
                      <button type="submit" class="btn btn-outline-secondary" style="background-image: url('static/img/50p.png');">Submit</button>
                  </form>
              </div>
          </div>
      </div>
  </div>
</@c.page>
