import React, { useState } from 'react';

function AttendanceForm() {
  const [attendance, setAttendance] = useState([]);

  const handleAttendanceChange = (event) => {
    const { name, value } = event.target;
    setAttendance((prevAttendance) => ({
      ...prevAttendance,
      [name]: value,
    }));
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    // Perform attendance submission logic here
    console.log(attendance);
    // Reset the form
    setAttendance([]);
  };

  return (
    <div>
      <h2>Attendance Form</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="studentName">Student Name:</label>
          <input
            type="text"
            id="studentName"
            name="studentName"
            value={attendance.studentName || ''}
            onChange={handleAttendanceChange}
          />
        </div>
        <div>
          <label htmlFor="date">Date:</label>
          <input
            type="date"
            id="date"
            name="date"
            value={attendance.date || ''}
            onChange={handleAttendanceChange}
          />
        </div>
        <div>
          <label htmlFor="status">Status:</label>
          <select id="status" name="status" value={attendance.status || ''} onChange={handleAttendanceChange}>
            <option value="">Select Status</option>
            <option value="present">Present</option>
            <option value="absent">Absent</option>
          </select>
        </div>
        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default AttendanceForm;
