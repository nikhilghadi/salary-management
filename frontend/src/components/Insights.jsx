import { useState } from "react";
import { getCountryInsights, getJobInsights } from "../api/client";

export default function Insights() {
  const [country, setCountry] = useState("");
  const [jobTitle, setJobTitle] = useState("");
  const [data, setData] = useState(null);

  const fetchCountry = async () => {
    const res = await getCountryInsights(country);
    setData(res);
  };

  const fetchJob = async () => {
    const res = await getJobInsights(country, jobTitle);
    setData(res);
  };

  return (
    <div>
      <h2>Insights</h2>

      <input placeholder="Country" onChange={e => setCountry(e.target.value)} />
      <button onClick={fetchCountry}>Country Stats</button>

      <input placeholder="Job Title" onChange={e => setJobTitle(e.target.value)} />
      <button onClick={fetchJob}>Job Stats</button>

      {data && (
        <pre>{JSON.stringify(data, null, 2)}</pre>
      )}
    </div>
  );
}