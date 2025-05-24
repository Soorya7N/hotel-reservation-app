<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Booking Successful</title>
<style>
    .rich-home-button {
                margin-bottom: 30px;
            }

            .home-link {
                display: inline-flex;
                align-items: center;
                padding: 12px 22px;
                background: linear-gradient(135deg, #007bff, #00c6ff);
                color: #fff;
                font-weight: 600;
                font-size: 1rem;
                text-decoration: none;
                border-radius: 50px;
                box-shadow: 0 6px 18px rgba(0, 123, 255, 0.3);
                transition: all 0.3s ease-in-out;
                letter-spacing: 0.5px;
            }

            .home-link i {
                margin-right: 10px;
                font-size: 1.2rem;
            }

            .home-link:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 24px rgba(0, 123, 255, 0.4);
                background: linear-gradient(135deg, #0056b3, #009fdd);
            }
</style>
</head>
<body>
    <div class="rich-home-button">
        <a href="${pageContext.request.contextPath}/home" class="home-link">
            <i class="fas fa-home"></i> Home
        </a>
    </div>
    <h2>${message}</h2>
    <a href="${pageContext.request.contextPath}/new">Make Another Booking</a>
</body>
</html>
