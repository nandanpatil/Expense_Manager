<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file="/components/all_css.jsp" %>
</head>
<body>
	<%@include file="/components/navbar.jsp" %>
	
	<section class="vh-100 bg-image">
  <div class="mask d-flex align-items-center h-85 gradient-custom-3">
    <div class=" p-5 container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class=" card" style="border-radius: 15px;">
            <div class="card-body p-3">
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>

              <form method="post" action="RegisterUser">

                <div data-mdb-input-init class="form-outline mb-2">
                  <label class="form-label" for="form3Example1cg">Your Name</label>
                  <input type="text" name="name" id="form3Example1cg" class="form-control form-control-lg" />
                 
                </div>

                <div data-mdb-input-init class="form-outline mb-2">
                  <label class="form-label" for="form3Example3cg">Your Email</label>
                  <input type="email" name="email" id="form3Example3cg" class="form-control form-control-lg" />
                </div>

                <div data-mdb-input-init class="form-outline mb-2">
                  <label class="form-label" for="form3Example4cg">Password</label>
                  <input type="password" name="password" id="form3Example4cg" class="form-control form-control-lg" />
                </div>

          

                <div class="d-flex justify-content-center">
                  <button  type="submit" data-mdb-button-init
                    data-mdb-ripple-init class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="login.jsp"
                    class="fw-bold text-body"><u>Login here</u></a></p>

              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>