import moment from "moment/moment";
import React, { useCallback, useEffect, useState } from "react";
import Moment from "react-moment";

export const BalanceHeaders = (props) => {
  return props.headers.map((header) => {
    return (
      <th key={header}>
        <Moment format="MMM YYYY">{header}</Moment>
      </th>
    );
  });
};
