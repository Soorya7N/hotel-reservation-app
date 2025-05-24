<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Maharajas</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
            background: linear-gradient(135deg, #e0eafc, #cfdef3);
            min-height: 100vh;
            padding: 30px 20px;
        }
        h1 {
            font-size: 3rem;
            color: #2c3e50;
            margin-bottom: 20px;
            text-align: center;
        }
        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            margin-bottom: 40px;
        }
        .btn {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px 20px;
            font-size: 1.1rem;
            font-weight: 600;
            color: white;
            background: #2980b9;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn:hover {
            background: #3498db;
            transform: translateY(-3px);
        }
        .btn i {
            margin-right: 10px;
        }
        .rooms-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
        }
        .room-card {
            background: white;
            padding: 25px;
            padding-top: 50px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            cursor: pointer;
            position: relative;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        }
        .room-card:hover {
            transform: translateY(-10px);
        }
        .room-status {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 5px 10px;
            border-radius: 8px;
            font-weight: bold;
            color: white;
        }
        .occupied { background-color: red; }
        .vacant { background-color: green; }
        .dirty { background-color: goldenrod; }
        .amenities-box {
            display: none;
            margin-top: 15px;
            background: #f4f4f4;
            padding: 5px;
            border-radius: 10px;
            font-size: 0.9rem;
        }
        .room-card.active .amenities-box {
            display: block;
        }
        .book-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 15px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        .book-btn:hover {
            background-color: #2ecc71;
        }
        .book-btn.disabled {
            background: #ccc;
            color: #666;
            cursor: not-allowed;
            box-shadow: none;
            pointer-events: none;
        }
    </style>
</head>
<body>
<h1>Welcome to Hotel Maharajas</h1>
<div class="button-container">
    <a class="btn" href="/new">
        <i class="fas fa-plus-circle"></i> Book now
    </a>
    <a class="btn" href="/getAllBookings">
        <i class="fas fa-list"></i> View All Bookings
    </a>
</div>

<div class="rooms-container">
    <c:forEach var="room" items="${rooms}">
        <div class="room-card" onclick="this.classList.toggle('active')">
            <div class="room-status ${room.status == 'Occupied' ? 'occupied' : (room.status == 'Vacant' ? 'vacant' : 'dirty')}">
                ${room.status}
            </div>
            <h3>${room.name} - ${room.id}</h3>
            <p>Type: ${room.type}</p>
            <p>Rent: ₹${room.rent}</p>
            <p>Max Persons: ${room.maxPersonsAllowed}</p>
            <div class="amenities-box">
                <strong>Amenities:</strong>
                <ul>
                    <c:forEach var="entry" items="${room.amenities}">
                        <c:if test="${entry.value}">
                            <li>${entry.key}</li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <c:choose>
                <c:when test="${room.status == 'Occupied'}">
                    <a class="book-btn disabled" href="javascript:void(0);" onclick="return false;" title="Room is occupied">Book Now</a>
                </c:when>
                <c:otherwise>
                    <a class="book-btn" href="/new?roomId=${room.id}&roomRent=${room.rent}">Book Now</a>
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>
</div>
</body>
</html>