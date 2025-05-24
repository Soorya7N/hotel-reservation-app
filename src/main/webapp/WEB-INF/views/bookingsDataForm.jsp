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
                background: #ffffff;
                padding: 24px;
                margin: 30px auto;
                border-radius: 16px;
                box-shadow: 0 6px 24px rgba(0, 0, 0, 0.08);
                max-width: 100%;
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                min-width: 960px;
                font-family: 'Segoe UI', sans-serif;
                font-size: 15px;
                color: #444;
            }

            thead {
                background: linear-gradient(to right, #3f87a6, #ebf8e1);
                color: #fff;
                border-radius: 10px;
            }

            thead th {
                padding: 16px 18px;
                text-align: left;
                font-weight: 700;
                letter-spacing: 0.5px;
                background-color: #2c3e50;
                color: #fff;
                position: sticky;
                top: 0;
                z-index: 1;
            }

            tbody tr {
                transition: background-color 0.25s ease-in-out, transform 0.1s;
            }

            tbody tr:nth-child(even) {
                background-color: #f7f9fc;
            }

            tbody tr:hover {
                background-color: #e3f2fd;
                transform: scale(1.005);
            }

            td {
                padding: 14px 18px;
                border-bottom: 1px solid #e0e0e0;
                color: #2d3436;
                vertical-align: middle;
            }

            td:last-child {
                white-space: nowrap;
            }

            a {
                color: #2e86de;
                text-decoration: none;
                font-weight: 600;
                transition: color 0.3s ease;
            }

            a:hover {
                color: #1b4f72;
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
<div class="rich-home-button">
    <a href="${pageContext.request.contextPath}/home" class="home-link">
        <i class="fas fa-home"></i> Home
    </a>
</div>
</html>