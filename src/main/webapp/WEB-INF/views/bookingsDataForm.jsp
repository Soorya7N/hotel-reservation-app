<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Booking List</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f6f9;
                margin: 0;
                padding: 20px;
            }
    
            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
    
            .table-container {
                overflow-x: auto;
                box-shadow: 0 4px 12px rgba(0,0,0,0.05);
                border-radius: 10px;
                background: white;
                padding: 20px;
            }
    
            table {
                width: 100%;
                border-collapse: collapse;
                min-width: 1000px;
            }
    
            thead {
                background-color: #007bff;
                color: #fff;
            }
    
            thead th {
                padding: 12px 15px;
                text-align: left;
                font-weight: 600;
            }
    
            tbody tr {
                transition: background-color 0.2s ease;
            }
    
            tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }
    
            tbody tr:hover {
                background-color: #eef5ff;
            }
    
            td {
                padding: 12px 15px;
                border-bottom: 1px solid #ddd;
                color: #333;
                vertical-align: top;
            }
    
            a {
                color: #007bff;
                text-decoration: none;
                font-weight: bold;
            }
    
            a:hover {
                text-decoration: underline;
            }
            .btn-checkout {
                background: linear-gradient(45deg, #28a745, #218838);
                border: none;
                color: #fff;
                padding: 12px 28px;
                font-size: 1.1rem;
                font-weight: 600;
                border-radius: 30px;
                cursor: pointer;
                box-shadow:
                0 4px 15px rgba(40, 167, 69, 0.4),
                0 0 8px rgba(40, 167, 69, 0.6);
                transition: 
                background 0.3s ease,
                box-shadow 0.3s ease,
                transform 0.2s ease;
                text-transform: uppercase;
                letter-spacing: 1px;
                user-select: none;
            }
            .btn-checkout:hover {
                background: linear-gradient(45deg, #218838, #1e7e34);
                box-shadow:
                0 6px 20px rgba(33, 136, 56, 0.7),
                0 0 12px rgba(33, 136, 56, 0.8);
                transform: scale(1.05);
            }
            .btn-checkout:active {
                transform: scale(0.97);
            }
            .btn-checkout:focus {
                outline: none;
                box-shadow:
                0 0 8px 3px rgba(72, 180, 97, 0.8);
            }

  /* Greyed out read-only field with subtle shadow */
  .readonly-status {
    background-color: #e9ecef;
    color: #6c757d;
    border: 1px solid #ced4da;
    padding: 10px 18px;
    border-radius: 25px;
    font-size: 1.1rem;
    width: 140px;
    text-align: center;
    box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);
    user-select: none;
    cursor: default;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
  }
    
            @media screen and (max-width: 768px) {
                table, thead, tbody, th, td, tr {
                    display: block;
                }
    
                thead {
                    display: none;
                }
    
                tr {
                    margin-bottom: 15px;
                    border: 1px solid #ccc;
                    border-radius: 8px;
                    padding: 10px;
                    background: #fff;
                }
    
                td {
                    padding: 8px;
                    text-align: right;
                    position: relative;
                }
    
                td::before {
                    content: attr(data-label);
                    position: absolute;
                    left: 10px;
                    width: 50%;
                    text-align: left;
                    font-weight: bold;
                    color: #555;
                }
            }
        </style>
    </head>
<body>
    <h2>Booking List</h2>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Booking Ref</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Address</th>
                    <th>Guests</th>
                    <th>Room No</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Room Fare</th>
                    <th>Bill Amount</th>
                    <th>Balance</th>
                    <th>No. of Days</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td data-label="Booking Ref">
                            <a href="${pageContext.request.contextPath}/bookings/${booking.bookingRefId}">
                                ${booking.bookingRefId}
                            </a>
                        </td>
                        <td data-label="Name">${booking.guestName}</td>
                        <td data-label="Age">${booking.guestAge}</td>
                        <td data-label="Address">
                            ${booking.address1}, ${booking.address2},<br/>
                            ${booking.city}, ${booking.state}, ${booking.country} - ${booking.pincode}
                        </td>
                        <td data-label="Guests">${booking.noOfGuests}</td>
                        <td data-label="Room No">${booking.roomNum}</td>
                        <td data-label="Check-In">${booking.checkInDateFormatted}</td>
                        <td data-label="Check-Out">${booking.checkOutDateFormatted}</td>
                        <td data-label="Room Fare">${booking.roomRent}</td>
                        <td data-label="Bill Amount">${booking.billAmount}</td>
                        <td data-label="Balance Amt">${booking.remainingBalance}</td>
                        <td data-label="No. of Days">${booking.noOfDaysStay}</td>
                        <td data-label="Status">
                            <c:choose>
                                <c:when test="${booking.occupied}">
                                    <form action="${pageContext.request.contextPath}/bookings/${booking.bookingRefId}" style="display:inline;">
                                        <button type="submit" class="btn-checkout">Check Out</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" class="readonly-status" value="Checked Out" readonly disabled />
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
<div style="margin-bottom: 20px;">
    <a href="${pageContext.request.contextPath}/home" style="text-decoration: none; color: #007bff; font-weight: bold;">
        <i class="fas fa-home"></i> Home
    </a>
</div>
</html>