import React, { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import { BalanceHeaders } from "./BalanceHeaders";
import { AccountRow } from "./AccountRow";
import moment from "moment/moment";

const Balances = (props) => {
  const [headers, setHeaders] = useState([]);

  useEffect(() => {
    var start = moment(props.startDate);
    var end = moment(props.endDate);

    var result = [];

    if (end.isBefore(start)) {
      throw "End date must be greated than start date.";
    }

    while (start.isSameOrBefore(end)) {
      result.push(start.format("YYYY-MM-01"));
      start.add(1, "month");
    }

    setHeaders(result);
  }, [props.startDate, props.endDate]);

  const allBalances = (
    <div className="col-md-12 col-lg-12">
      <div className="card mb-4">
        <div className="card-body">
          <h5 className="card-title">Balances</h5>
          <table className="table table-responsive">
            <thead>
              <tr>
                <th>Account</th>
                <BalanceHeaders
                  startDate={props.startDate}
                  endDate={props.endDate}
                  headers={headers}
                />
              </tr>
            </thead>
            <tbody>
              {props.accounts.map((account) => {
                return (
                  <AccountRow
                    key={account.id}
                    account={account}
                    headers={headers}
                  />
                );
              })}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
  const noBalance = (
    <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
      <h4>
        No balances yet. Why not <Link to="/new_balance">create one</Link>
      </h4>
    </div>
  );

  return (
    <div className="row">{true ? allBalances : noBalance}</div>
    // <div className="row">{balances.length > 0 ? allBalances : noBalance}</div>
  );
};

export default Balances;
