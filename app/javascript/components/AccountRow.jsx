import React, { useCallback, useEffect, useState } from "react";
export const AccountRow = (props) => {
  const [columnData, setColumnData] = useState([]);
  const getBalanceForHeaders = useCallback(() => {
    const columns = props.headers.map((h) => {
      const foundBalance = props.account.balances.filter((b) => {
        return b.balance_date.includes(h.substring(0, 7));
      });
      return {
        header: h,
        balance: foundBalance.length > 0 ? foundBalance[0].amount : "0",
      };
    });
    setColumnData(columns);
  }, [props.headers]);

  useEffect(() => {
    getBalanceForHeaders();
  }, [getBalanceForHeaders]);
  return (
    <tr>
      <td>{props.account.name}</td>
      {columnData.map((c, index) => {
        return (
          <td key={`${props.account.name}-${c.header}-${index}`}>
            {c.balance}
          </td>
        );
      })}
    </tr>
  );
};
