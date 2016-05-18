@LaneList = React.createClass
  render: ->
    lanes = for lane in @props.lanes
      <Lane key=lane.id lane=lane onRemove=@removeLane updateLane=@props.updateLane removeLane=@props.removeLane />

    <tbody>
      { lanes }
    </tbody>
