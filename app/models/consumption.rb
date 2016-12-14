class Consumption < ApplicationRecord
  validates_numericality_of :sunday, less_than: 11, greater_than: -1
  validates_numericality_of :monday, less_than: 11, greater_than: -1
  validates_numericality_of :tuesday, less_than: 11, greater_than: -1
  validates_numericality_of :wednesday, less_than: 11, greater_than: -1
  validates_numericality_of :thursday, less_than: 11, greater_than: -1
  validates_numericality_of :friday, less_than: 11, greater_than: -1
  validates_numericality_of :saturday, less_than: 11, greater_than: -1
  belongs_to :user

  def day_set
    [sunday, monday, tuesday, wednesday, thursday, friday, saturday]
  end

  def options
    { 
      legend: {
        display: false
      },
      scales: {
        yAxes: [{
          ticks: {
            max: 10,
            min: 0,
            stepSize: 1
          }
        }]
      }
    }
  end

  def data
    {
      labels: ["Monday","Tuesday","Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
      datasets: [
        {
          fillColor: "rgba(252,233,79,0.5)",
          strokeColor: "rgba(82,75,25,1)",
          pointColor: "rgba(166,152,51,1)",
          pointStrokeColor: "#fff",
          data: day_set,
          fill: false,
          lineTension: 0.1,
          backgroundColor: "rgba(75,192,192,0.4)",
          borderColor: "rgba(75,192,192,1)",
          borderCapStyle: 'butt',
          borderDash: [],
          borderDashOffset: 0.0,
          borderJoinStyle: 'miter',
        }
      ]
    }
  end
end
