import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import Balances from "./Balances";
import moment from "moment/moment";

export const Dashboard = () => {
  const [accounts, setAccounts] = useState([]);
  let currentdate = new Date();
  let threeMonthsLater = new Date(
    currentdate.setMonth(currentdate.getMonth() + 3)
  );

  const [startDate, setStartDate] = useState(
    moment(new Date()).format("YYYY-MM-01")
  );
  const [endDate, setEndDate] = useState(
    moment(threeMonthsLater).format("YYYY-MM-01")
  );

  useEffect(() => {
    const url = `/api/v1/accounts?start_date=${startDate}&end_date=${endDate}`;
    fetch(url)
      .then((res) => {
        if (res.ok) {
          return res.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((res) => setAccounts(res))
      .catch(() => navigate("/"));
  }, [startDate, endDate]);

  return (
    <>
      <section className="jumbotron jumbotron-fluid text-center">
        <div className="container py-5">
          <h1 className="display-4">Portfolio Manager</h1>
          <p className="lead text-muted">For monitoring portfolios</p>
        </div>
      </section>
      <div className="py-5">
        <main className="container">
          <div className="text-end mb-3">
            <Link to="/balance" className="btn custom-button">
              Create New Balance
            </Link>
          </div>
          <div className="row mb-3">
            <div className="col-md-6">
              <label>Start Date</label>
              <input
                type="date"
                value={startDate || ""}
                onChange={(e) => {
                  start = moment(e.target.value);
                  setStartDate(
                    start.isValid() ? start.format("YYYY-MM-01") : ""
                  );
                }}
              />
            </div>
            <div className="col-md-6">
              <label>End Date</label>
              <input
                type="date"
                value={endDate || ""}
                onChange={(e) => {
                  end = moment(e.target.value);
                  setEndDate(end.isValid() ? end.format("YYYY-MM-01") : "");
                }}
              />
            </div>
          </div>
          <Balances
            startDate={startDate}
            endDate={endDate}
            accounts={accounts}
          />
        </main>
      </div>
    </>
  );
};
