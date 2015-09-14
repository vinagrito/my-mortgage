@LaneList = React.createClass
  getInitialState: ->
    lanes: @props.lanes
    total: { amount: 0, monthReturn: 0, bankGain: 0 }

  handleRemoveLane: (lane)->
    @props.onRemoveClick(lane)

  updateLane: (laneID, value) ->
    currentLane = @state.lanes.find (lane) -> lane.id is laneID
    $.extend(currentLane, value)

    @updateTotalFinanciation()

  updateTotalFinanciation: ->
    total = @props.lanes.reduce (prev, curr) ->
      {
        amount: prev.amount + parseInt(curr.amount),
        monthReturn: prev.monthReturn + parseInt(curr.monthReturn),
        bankGain: prev.bankGain + parseInt(curr.bankGain),
      }
    , { amount: 0, monthReturn: 0, bankGain: 0 }

    @setState total: total

  render: ->
    lanes = for lane in @props.lanes
      `<Lane key={lane.id} lane={lane} onRemove={this.handleRemoveLane} updateTotal={this.updateLane}/>`

    `<tbody>
      { lanes }
      <TotalFinanciation total={this.state.total} />
    </tbody>`
