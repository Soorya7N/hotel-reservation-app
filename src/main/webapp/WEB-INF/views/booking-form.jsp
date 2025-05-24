<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hotel Booking Form</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            margin: 0;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            overflow-y: auto;
        }
        .container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 1200px;
            border: 2px solid #4a90e2;
            box-sizing: border-box;
            max-height: calc(100vh - 80px);
            overflow-y: auto;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        form {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-gap: 20px 30px;
            align-items: center;
        }
        label {
            font-weight: 600;
            color: #555;
            justify-self: start;
            grid-column: span 1;
        }
        input[type="text"],
        input[type="number"],
        input[type="datetime-local"] {
            padding: 10px 12px;
            border: 1.5px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            width: 100%;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
            grid-column: span 3;
        }
        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="datetime-local"]:focus {
            border-color: #4a90e2;
            outline: none;
        }
        .submit-btn {
            grid-column: 1 / -1;
            padding: 14px 0;
            background: #4a90e2;
            border: none;
            border-radius: 10px;
            color: white;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.3s ease;
            margin-top: 20px;
        }
        .submit-btn:hover {
            background: #357ABD;
        }
        @media (max-width: 900px) {
            form {
                grid-template-columns: repeat(2, 1fr);
            }
            label, input {
                grid-column: auto !important;
                width: 100%;
            }
        }
        @media (max-width: 600px) {
            form {
                grid-template-columns: 1fr;
            }
            .submit-btn {
                margin-top: 30px;
            }
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
    </style>
</head>
    <div class="rich-home-button">
        <a href="${pageContext.request.contextPath}/home" class="home-link">
            <i class="fas fa-home"></i> Home
        </a>
    </div>
<body>
<div class="container">
    <h2>Hotel Booking Form</h2>
    <form action="${pageContext.request.contextPath}/create" method="post" onsubmit="return formatDatesBeforeSubmit()">
        <label for="roomNum">Room Number</label>
        <input type="text" id="roomNum" name="roomNum" value="${roomId}"/>

        <label for="guestName">Guest Name</label>
        <input type="text" id="guestName" name="guestName" required />

        <label for="guestAge">Guest Age</label>
        <input type="text" id="guestAge" name="guestAge" required />

        <label for="address1">Address Line 1</label>
        <input type="text" id="address1" name="address1" />

        <label for="address2">Address Line 2</label>
        <input type="text" id="address2" name="address2" />

        <label for="city">City</label>
        <input type="text" id="city" name="city" />

        <label for="state">State</label>
        <input type="text" id="state" name="state" />

        <label for="country">Country</label>
        <input type="text" id="country" name="country" />

        <label for="pincode">Pincode</label>
        <input type="text" id="pincode" name="pincode" />

        <label for="noOfGuests">Number of Guests</label>
        <input type="number" id="noOfGuests" name="noOfGuests" />

        <label for="checkInDateRaw">Check-in Date & Time</label>
        <input type="datetime-local" id="checkInDateRaw" required />
        <input type="hidden" name="checkInDate" id="checkInDate" />

        <label for="checkOutDateRaw">Check-out Date & Time</label>
        <input type="datetime-local" id="checkOutDateRaw" />
        <input type="hidden" name="checkOutDate" id="checkOutDate" />

        <label for="roomFare">Room Fare</label>
        <input type="text" id="roomFare" name="roomFare" />

        <label for="billAmt">Total Bill Amount</label>
        <input type="text" id="billAmt" name="billAmt" />

        <label for="advance">Advance Paid</label>
        <input type="text" id="advance" name="advance" />

        <label for="noOfDaysStay">Number of Days Stay</label>
        <input type="number" id="noOfDaysStay" name="noOfDaysStay" />

        <input type="submit" class="submit-btn" value="Book Now" />
    </form>
</div>

<script>
function formatDatesBeforeSubmit() {
    const checkInInput = document.getElementById("checkInDateRaw").value;
    const checkOutInput = document.getElementById("checkOutDateRaw").value;

    if (!checkInInput) {
        alert("Please select check-in date.");
        return false;
    }

    // Send as is: e.g. "2025-05-17T16:14"
    document.getElementById("checkInDate").value = checkInInput;
    document.getElementById("checkOutDate").value = checkOutInput;

    return true;
}
function calculateBill() {
    const checkInStr = document.getElementById("checkInDateRaw").value;
    const checkOutStr = document.getElementById("checkOutDateRaw").value;
    const roomFareStr = document.getElementById("roomFare").value;

    if (!checkInStr || !checkOutStr || !roomFareStr) {
        return;
    }

    const checkIn = new Date(checkInStr);
    const checkOut = new Date(checkOutStr);
    const roomFare = parseFloat(roomFareStr);

    if (isNaN(roomFare)) {
        alert("Please enter a valid room fare.");
        return;
    }

    if (checkOut <= checkIn) {
        alert("Check-out must be after check-in.");
        return;
    }

    const checkInHour = checkIn.getHours();
    const checkInMidnight = new Date(checkIn);
    checkInMidnight.setHours(0, 0, 0, 0);

    const checkOutMidnight = new Date(checkOut);
    checkOutMidnight.setHours(0, 0, 0, 0);

    let numDays = Math.floor((checkOutMidnight - checkInMidnight) / (1000 * 60 * 60 * 24));
    if (numDays < 1) numDays = 1; // Minimum 1 day

    // Determine checkout cutoff based on check-in time
    const cutoff = new Date(checkOutMidnight);
    if (checkInHour < 12) {
        // Check-in before 12 PM → Checkout before 12 PM next day
        cutoff.setHours(12, 0, 0, 0); // 12:00 PM
    } else {
        // Check-in at or after 12 PM → Checkout before 2 PM next day
        cutoff.setHours(14, 0, 0, 0); // 2:00 PM
    }

    if (checkOut > cutoff) {
        numDays += 1;
    }

    const billAmount = numDays * roomFare;

    document.getElementById("noOfDaysStay").value = numDays;
    document.getElementById("billAmt").value = billAmount.toFixed(2);
}


// Trigger calculation when dates or room fare change
document.getElementById("checkInDateRaw").addEventListener("change", calculateBill);
document.getElementById("checkOutDateRaw").addEventListener("change", calculateBill);
document.getElementById("roomFare").addEventListener("input", calculateBill);
</script>
</body>
</html>
