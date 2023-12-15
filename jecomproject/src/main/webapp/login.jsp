<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <%@ include file="commom_components/common_css.jsp" %>
    <style>
      #myVideo {
        position: fixed;
        right: 0;
        bottom: 0;
        min-width: 100%;
        min-height: 100%;
      }

      /* Add some content at the bottom of the video/page */
      .content {
        position: fixed;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5);
        color: #f1f1f1;
        width: 100%;
        padding: 20px;

      }
    </style>
</head>

<body>
  <%-- <%@ include file="/commom_components/navbar.jsp" %> --%>


    <!-- Section: Design Block -->

    <section class="">
      <video autoplay muted loop id="myVideo" style="z-index:-1">
        <source src="images/black_-_13495 (720p).mp4.mp4" type="video/mp4">
      </video>
      <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="z-index:1">
        <div class="container">
          <div class="row gx-lg-5 align-items-center">
            <div class="col-lg-7 mb-5 mb-lg-0">
              <h1 class="my-5 display-3 fw-bold ls-tight">
                The best offer <br />
                <span class="text-primary">for your business</span>
              </h1>
              <p style="color: hsl(217, 10%, 50.8%)">
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Eveniet, itaque accusantium odio, soluta, corrupti aliquam
                quibusdam tempora at cupiditate quis eum maiores libero
                veritatis? Dicta facilis sint aliquid ipsum atque?
              </p>
            </div>

            <div class="col-lg-5 mb-5 mb-lg-0">

              <div class="card" style="height:85vh;">
                <div class="col-md-12 text-center pt-5 mx-auto">
                  <h3>Your Company</h3>
                </div>
                <div class="card-body py-2 px-md-5">
                  <form action="login" method="post">
                    <div class="row pt-4">
                      <!-- Email input -->
                      <div class="form-outline mb-3 py-2">
                        <input type="email" id="form3Example3" class="form-control ps-2" name="email" placeholder="Email address"
                          required="required" />
                      </div>

                      <!-- Password input -->
                      <div class="form-outline mb-3 py-2">
                        <input type="password" id="form3Example4" name="password" class="form-control ps-2" placeholder="Password"
                          required="required" />
                      </div>
                      <div class="row mb-4 justify-content-center py-2">
                        <!-- Checkbox -->
                        <div class="col-md-5  mb-lg-4 ">
                          <input class="form-check-input ms-1" type="checkbox" value="" id="form2Example31" />
                          <label class="form-check-label ms-1" for="form2Example31">Remember
                            me </label>
                        </div>

                        <div class="col-md-7 mb-3 mb-lg-4 ">
                          <!-- Simple link -->
                          <a href="#!">Forgot password?</a>
                        </div>
                      </div>

                      <!-- Checkbox -->
                      <div class="form-check mb-3 ms-3 me-2 ">
                        <input class="form-check-input me-2 " type="checkbox" value="" id="form2Example33" />
                        <label class="form-check-label" for="form2Example33">
                          I do accept the <a href="#!" class="text-white"><u style="color:blue;">Terms and
                              Conditions</u></a> of your
                          site.
                        </label>
                      </div>

                      <div class="form-outline d-flex  mb-3 mb-lg-4 mx-auto pt-3">
                        <button type="submit" class="btn btn-primary btn-lg">Sign In</button>
                      </div>

                      <p class=" form-outline d-flex justify-content-center mx-auto text-left text-muted mt-2 mb-3 mb-lg-4">
                        Create an account! &nbsp;<a href="register.jsp" class="fw-bold text-body"><u> Register
                            Here</u></a></p>


                      <div class="form-outline text-center">
                        <p>or sign in with:</p>
                        <button type="button" class="btn btn-link btn-floating mx-1">
                          <i class="fab fa-facebook-f"></i>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">
                          <i class="fab fa-google"></i>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">
                          <i class="fab fa-twitter"></i>
                        </button>

                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </section>

 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>