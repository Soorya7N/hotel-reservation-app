<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Booking List</title>
        <style>
            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
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
                background: rgba(255, 255, 255, 0.7);
                backdrop-filter: blur(12px);
                padding: 24px;
                margin: 40px auto;
                border-radius: 20px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
                max-width: 95%;
                transition: all 0.3s ease;
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                min-width: 960px;
                font-family: 'Segoe UI', 'San Francisco', system-ui, sans-serif;
                font-size: 15px;
                color: #333;
            }

            thead {
                background: linear-gradient(90deg, #0f2027, #203a43, #2c5364);
                color: #fff;
            }

            thead th {
                padding: 18px 20px;
                text-align: left;
                font-weight: 700;
                letter-spacing: 0.6px;
                background-color: rgba(44, 62, 80, 0.95);
                color: #fff;
                position: sticky;
                top: 0;
                z-index: 2;
                backdrop-filter: blur(8px);
                border-bottom: 2px solid rgba(255, 255, 255, 0.1);
            }

            tbody tr {
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            tbody tr:nth-child(even) {
                background-color: rgba(250, 250, 250, 0.8);
            }

            tbody tr:hover {
                background-color: #f0f4f8;
                transform: scale(1.01);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
                cursor: pointer;
            }

            td {
                padding: 16px 20px;
                border-bottom: 1px solid #ddd;
                color: #222;
                vertical-align: middle;
            }

            td:last-child {
                white-space: nowrap;
            }

            a {
                color: #0071e3;
                font-weight: 600;
                text-decoration: none;
                transition: all 0.2s ease-in-out;
            }

            a:hover {
                color: #005bb5;
                text-decoration: underline;
            }

            .btn-checkout {
                background: linear-gradient(to right, #0071e3, #005bb5); /* Apple-style blue */
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 12px;
                font-size: 14px;
                font-weight: 600;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
                cursor: pointer;
                box-shadow: 0 4px 14px rgba(0, 113, 227, 0.25);
                transition: all 0.3s ease;
                letter-spacing: 0.3px;
            }

            .btn-checkout:hover {
                background: linear-gradient(to right, #005bb5, #003d99);
                box-shadow: 0 6px 18px rgba(0, 113, 227, 0.35);
                transform: translateY(-1px);
            }

            .btn-checkout:active {
                transform: scale(0.97);
                box-shadow: 0 2px 8px rgba(0, 113, 227, 0.5);
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

            .readonly-status {
                background: rgba(255, 255, 255, 0.6);
                color: #495057;
                padding: 10px 20px;
                border: none;
                border-radius: 12px;
                font-size: 14px;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
                width: 100px;
                text-align: center;
                box-shadow: 
                    inset 1px 1px 2px rgba(255, 255, 255, 0.8),
                    inset -1px -1px 2px rgba(0, 0, 0, 0.05),
                    0 4px 6px rgba(0, 0, 0, 0.05);
                user-select: none;
                cursor: default;
                font-weight: 600;
                letter-spacing: 1.5px;
                backdrop-filter: blur(6px); /* Adds a glass-like effect */
                transition: all 0.3s ease;
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
    <div class="rich-home-button">
    <a href="${pageContext.request.contextPath}/home" class="home-link">
        <i class="fas fa-home"></i> Home
    </a>
    </div>
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
</html>