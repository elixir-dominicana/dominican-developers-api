defmodule Utils.CSVCreator do
  def create_csv(data, filepath) do
    csv = Enum.join(data)

    File.write!(filepath, csv)
  end

  def parser_data(data) do
    raw =
      data
      |> Map.values()
      |> Enum.join(",")

    "#{raw}\n"
  end

  def put_headers(data, headers) do
    raw = "#{Enum.join(headers, ",")}\n"

    [raw | data]
  end
end
