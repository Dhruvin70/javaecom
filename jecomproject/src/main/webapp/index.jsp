<%@ page import="com.DB.DBConnect, java.sql.Connection, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diamond Corporation</title>
    <%@ include file="/commom_components/common_css.jsp" %>
    <style>
        .stickyimage {
            margin-top: 20px;
            background: white;
            background-image: url('images/XXX-copy.jpg');
            height: 90vh;
            width: 100%;
            background-size: cover;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }

        .card-container {
            display: flex;
            flex-flow: row wrap;
            justify-content: space-around;
            margin-top: 20px;
        }

        .card {
            width: 100%;
            max-width: 250px;
            border: solid 1px white;
            box-shadow: 0px 0px 2px 2px rgb(255, 255, 255);
            border-radius: 10px;
            margin: 10px;
            transition: 0.4s;
        }

        .card:hover {
            background: #f1f8e9;
            box-shadow: 0px 0px 5px 5px rgba(0, 0, 0, 0.692);
        }

        .card img {
            
            width: 100%;
            height: auto;
            max-height: 200px;
        }

        .card-text {
            text-align: center;
        }

        .btn-container {
            display: flex;
            justify-content: center;
        }

        .btn-container .btn {
            width: 100%;
            max-width: 200px;
            height: 40px;
        }
    </style>
</head>

<body style="background-color: #a1e257e1">
<%@ include file="/commom_components/loginnavbar.jsp" %>
    <%@ include file="/commom_components/navbar.jsp" %>
    <% Connection connection = DBConnect.getConn();

        out.println(connection+"success");
     %>

   
    <%@ include file="commom_components/content.jsp" %>

    <!-- Recent Search Items -->
    <div class="container">
        <h3 class="text-center p-4">Recent Search</h3>
        <div class="card-container">
            <div class="card">
                <div class="card-body text-center">
                    <img src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg" alt="Card image"
                        class="img-thumbnail ">
                    <p class="card-text">Code</p>
                    <p class="card-text">Item</p>
                    <p class="card-text">Categories: Company</p>
                    <div class="btn-container">
                        <a href="#" class="btn btn-outline-success">Add to Cart</a>
                    </div>
                </div>
            </div>
            <!-- Add more cards as needed -->
             <div class="card">
                <div class="card-body text-center">
                    <img src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg" alt="Card image"
                        class="img-thumbnail">
                    <p class="card-text">Code</p>
                    <p class="card-text">Item</p>
                    <p class="card-text">Categories: Company</p>
                    <div class="btn-container">
                        <a href="#" class="btn btn-outline-success">Add to Cart</a>
                    </div>
                </div>
            </div>
            <!-- Add more cards as needed -->
             <div class="card">
                <div class="card-body text-center">
                    <img src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg" alt="Card image"
                        class="img-thumbnail ">
                    <p class="card-text">Code</p>
                    <p class="card-text">Item</p>
                    <p class="card-text">Categories: Company</p>
                    <div class="btn-container">
                        <a href="#" class="btn btn-outline-success">Add to Cart</a>
                    </div>
                </div>
            </div>
            <!-- Add more cards as needed -->
             <div class="card">
                <div class="card-body text-center">
                    <img src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg" alt="Card image"
                        class="img-thumbnail">
                    <p class="card-text">Code</p>
                    <p class="card-text">Item</p>
                    <p class="card-text">Categories: Company</p>
                    <div class="btn-container">
                        <a href="#" class="btn btn-outline-success">Add to Cart</a>
                    </div>
                </div>
            </div>
            <!-- Add more cards as needed -->
        </div>
        <div class="text-center p-2">
            <a href="#" class="btn btn-danger btn text-white mt-5 mb-4" style="width: 100px;">View All</a>
        </div>
    </div>

    <div class="stickyimage"></div>

    <div class="container">
        <h3 class="text-center p-4">New Arrivals</h3>
        <div class="card-container">
            <div class="card">
                <div class="card-body text-center">
                    <img src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg" alt="Card image"
                        class="img-thumbnail">
                    <p class="card-text">Code</p>
                    <p class="card-text">Item</p>
                    <p class="card-text">Categories: Company</p>
                    <div class="btn-container">
                        <a href="#" class="btn btn-outline-success">Add to Cart</a>
                    </div>
                </div>
            </div>
            <!-- Add more cards as needed -->
             <div class="card">
                <div class="card-body text-center">
                    <img src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg" alt="Card image"
                        class="img-thumbnail">
                    <p class="card-text">Code</p>
                    <p class="card-text">Item</p>
                    <p class="card-text">Categories: Company</p>
                    <div class="btn-container">
                        <a href="#" class="btn btn-outline-success">Add to Cart</a>
                    </div>
                </div>
            </div>
            <!-- Add more cards as needed -->
             <div class="card">
                <div class="card-body text-center">
                    <img src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg" alt="Card image"
                        class="img-thumbnail">
                    <p class="card-text">Code</p>
                    <p class="card-text">Item</p>
                    <p class="card-text">Categories: Company</p>
                    <div class="btn-container">
                        <a href="#" class="btn btn-outline-success">Add to Cart</a>
                    </div>
                </div>
            </div>
            <!-- Add more cards as needed -->
             <div class="card">
                <div class="card-body text-center">
                    <img src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg" alt="Card image"
                        class="img-thumbnail ">
                    <p class="card-text">Code</p>
                    <p class="card-text">Item</p>
                    <p class="card-text">Categories: Company</p>
                    <div class="btn-container">
                        <a href="#" class="btn btn-outline-success">Add to Cart</a>
                    </div>
                </div>
            </div>
            <!-- Add more cards as needed -->
        </div>
    </div>

</body>

</html>


