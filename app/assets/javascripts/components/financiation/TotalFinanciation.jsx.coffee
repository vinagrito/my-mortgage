@TotalFinanciation = React.createClass
  render: ->
    total = this.props.total

    `<tr>
      <td />

      <td>
        <LaneTextInput addon="₪" placeholder="Total loan" disabled="disabled" value={total.amount} />
      </td>

      <td />

      <td className="col-lg-3">
        <LaneTextInput addon="₪" placeholder="Total monthly return" disabled="disabled" value={total.monthReturn}/>
      </td>

      <td />

      <td className="col-lg-3">
        <LaneTextInput addon="₪" placeholder="Total bank gain" disabled="disabled" value={total.bankGain}/>
      </td>

      <td />
    </tr>`
