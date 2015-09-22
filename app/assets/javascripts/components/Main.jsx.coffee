#= require_tree ./financiation

@Main = React.createClass
  getInitialState: ->
    lanes: []
    total: { amount: 0, monthReturn: 0, bankGain: 0 }

  addLane: ->
    lanes = @state.lanes
    lastLane = lanes[lanes.length - 1]
    id = if lastLane then lastLane.id else -1

    newLane = {
      id: id - 1, modality: "", amount: 0, rate: "", monthReturn: 0, years: "", bankGain: 0
    }
    lanes.push(newLane)
    @setState lanes: lanes

  handleLaneRemove: (lane) ->
    lanes = @state.lanes.slice()
    index = lanes.indexOf lane
    lanes.splice index, 1

    @setState lanes: lanes
    @totalFinanciation(lanes)

  monthReturn: (amount, rate, years) ->
    rate = rate / 100
    monthReturn = ((rate / 12) * amount) / (1 - (Math.pow((1 + (rate / 12)), (-years * 12))))
    Math.round(monthReturn * 10) / 10

  bankMonthGain: (lane) ->
    gain = lane.monthReturn * lane.years * 12
    Math.round(gain * 10) / 10

  handleLaneChange: (laneID, value) ->
    lanes = @state.lanes
    currentLane = lanes.find (lane) -> lane.id is laneID
    laneIndex = lanes.indexOf(currentLane)

    lanes.splice(laneIndex, 1)
    $.extend(currentLane, value)

    $.extend(currentLane, {
      monthReturn: @monthReturn(currentLane.amount, currentLane.rate, currentLane.years)
    })

    $.extend(currentLane, { bankGain: @bankMonthGain(currentLane) })

    lanes.splice(laneIndex, 0, currentLane)

    @setState lanes: lanes
    @totalFinanciation(lanes)

  totalFinanciation: (lanes) ->
    total = lanes.reduce (prev, curr) ->
      {
        amount: prev.amount + parseFloat(curr.amount) ,
        monthReturn: prev.monthReturn + parseFloat(curr.monthReturn),
        bankGain: prev.bankGain + parseFloat(curr.bankGain),
      }
    , { amount: 0, monthReturn: 0, bankGain: 0 }

    @setState total: total

  render: ->
    <div>
      <a className="btn btn-flat btn-success" onClick={@addLane}>+ Add Lane</a>

      <div className="row">
        <div className="col-lg-12">
          <table className="table table-striped table-hover">
            <thead>
              <th>Modality</th>
              <th>Amount</th>
              <th>Rate</th>
              <th>Return (monthly)</th>
              <th>Years</th>
              <th>Total return</th>
              <th></th>
            </thead>
            <LaneList lanes={@state.lanes} updateLane={@handleLaneChange} removeLane={@handleLaneRemove}/>
            {
              if @state.lanes.length > 0
                <tbody>
                  <TotalFinanciation total={@state.total} />
                </tbody>
            }
          </table>
        </div>
      </div>
    </div>
