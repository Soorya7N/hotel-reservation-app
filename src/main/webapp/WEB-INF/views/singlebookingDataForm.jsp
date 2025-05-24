<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
            background-color: #f4f7f9;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            position: relative;
        }
        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            position: relative;
        }
        .checkout-btn {
            position: absolute;
            top: 20px;
            right: 25px;
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }
        .card h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .info-row {
            display: flex;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
        .info-label {
            width: 30%;
            font-weight: bold;
            color: #555;
            display: flex;
            align-items: center;
        }
        .info-value {
            width: 70%;
            color: #333;
            display: flex;
            align-items: center;
        }
        .info-label i {
            margin-right: 8px;
            color: #007bff;
        }
        .info-row:last-child {
            border-bottom: none;
        }
        #popup {
            display: none;
            position: fixed;
            z-index: 100;
            left: 0;
            top: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(0,0,0,0.5);
        }
        #popup .popup-content {
            background: white;
            width: 300px;
            margin: 15% auto;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px #aaa;
        }
        #popup button {
            margin-top: 10px;
            padding: 8px 15px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
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
            .hidden {
                display: none !important;
            }
    </style>
    <script>
        function checkoutHandler() {
        var isPaid = document.getElementById('balancePaidCheckbox');
        var bookingId = '${bookings.bookingRefId}';
        const billAmt = '${bookings.billAmt}';
        const noOfDaysStay = '${bookings.noOfDaysStay}';

        if (isPaid && isPaid.checked) {
            fetch('<c:url value="/api/v1/bookings/checkout/${bookings.bookingRefId}" />', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    billAmt: billAmt,
                    noOfDaysStay: noOfDaysStay,
                    remainingBalance: 0,
                    occupied: false,
                    checkOutDate: new Date().toISOString()
                })
            })
            .then(response => {
                if (response.ok) {
                    window.location.href = "${pageContext.request.contextPath}/bookings/${bookings.bookingRefId}"; // Redirect to success page
                } else {
                    alert("Error checking out. Please try again.");
                }
            })
            .catch(error => {
                console.error('Checkout failed:', error);
                alert("Something went wrong.");
            });
        } else {
            // Show popup
            document.getElementById('popup').style.display = 'block';
        }
    }
    function closePopup() {
            document.getElementById('popup').style.display = 'none';
        }
    function showPaymentPopup() {
        document.getElementById('paymentPopup').classList.remove('hidden');
    }

    function closePaymentPopup() {
        document.getElementById('paymentPopup').classList.add('hidden');
    }

    function markAsPaid() {
        closePaymentPopup();
        alert("Payment marked as complete.");
        // Optionally set the checkbox as checked or send a request to backend
    }
    </script>
</head>
<body>
    <div class="rich-home-button">
        <a href="${pageContext.request.contextPath}/home" class="home-link">
            <i class="fas fa-home"></i> Home
        </a>
    </div>
    <div class="container">
        <div class="card">
            <h2><i class="fas fa-receipt"></i> Booking Details</h2>

            <c:if test="${bookings.occupied}">
                <button class="checkout-btn" method="put" onclick="checkoutHandler()">Checkout</button>
            </c:if>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-hashtag"></i> Booking Ref:</div>
                <div class="info-value">${bookings.bookingRefId}</div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-user"></i> Name:</div>
                <div class="info-value">${bookings.guestName}</div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-birthday-cake"></i> Age:</div>
                <div class="info-value">${bookings.guestAge}</div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-map-marker-alt"></i> Address:</div>
                <div class="info-value">
                    ${bookings.address1}, ${bookings.address2},<br/>
                    ${bookings.city}, ${bookings.state}, ${bookings.country} - ${bookings.pincode}
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-users"></i> No. of Guests:</div>
                <div class="info-value">${bookings.noOfGuests}</div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-door-open"></i> Room No:</div>
                <div class="info-value">${bookings.roomNum}</div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-sign-in-alt"></i> Check-In:</div>
                <div class="info-value">${bookings.checkInDateFormatted}</div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-sign-out-alt"></i> Check-Out:</div>
                <div class="info-value">${bookings.checkOutDateFormatted}</div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-money-bill-wave"></i> Room Fare:</div>
                <div class="info-value">${bookings.roomRent}</div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-file-invoice-dollar"></i> Bill Amount:</div>
                <div class="info-value">${bookings.billAmount}</div>
            </div>

           <div class="info-row">
                <div class="info-label"><i class="fas fa-file-invoice-dollar"></i> Balance Amount:</div>
                <div class="info-value">
                    ${bookings.remainingBalance}
                    <c:if test="${bookings.occupied}">
                        &nbsp;&nbsp;
                        <label>
                            <input type="checkbox" id="balancePaidCheckbox" /> Paid
                        </label>
                    </c:if>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-calendar-day"></i> No. of Days:</div>
                <div class="info-value">${bookings.noOfDaysStay}</div>
            </div>
        </div>
    </div>

    
    <div id="popup">
        <div class="popup-content">
            <p><strong>Please clear the outstanding balance before checkout.</strong></p>
            <button onclick="closePopup()">OK</button>
        </div>
    </div>

    <div id="paymentPopup" class="popup hidden">
        <div class="popup-content">
            <h3>Scan to Pay</h3>
            <img src="${pageContext.request.contextPath}/images/QR.jpeg" alt="UPI QR" class="qr-code" />
            <p>Please complete the payment and then click 'Mark as Paid'</p>
            <button onclick="markAsPaid()">Mark as Paid</button>
            <button onclick="closePaymentPopup()">Cancel</button>
        </div>
    </div>
    
</body>
</html>
