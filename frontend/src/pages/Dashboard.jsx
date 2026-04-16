import { useState } from "react";
import { getCountryInsights, getJobInsights } from "../api/client";

export default function Dashboard() {
  const [country, setCountry] = useState("");
  const [jobTitle, setJobTitle] = useState("");

  const [countryData, setCountryData] = useState(null);
  const [jobData, setJobData] = useState(null);
  const [error, setError] = useState("");

  const handleCountryInsights = async () => {
    setError("");
    try {
      const res = await getCountryInsights(country);
      if (res.error) {
        setError(res.error);
        return;
      }
      setCountryData(res);
    } catch (e) {
      setError("Something went wrong");
    }
  };

  const handleJobInsights = async () => {
    setError("");
    try {
      const res = await getJobInsights(country, jobTitle);
      if (res.error) {
        setError(res.error);
        return;
      }
      setJobData(res);
    } catch (e) {
      setError("Something went wrong");
    }
  };

  return (
    <div style={{ padding: "20px" }}>
      <h1>Dashboard</h1>

      {/* Input Section */}
      <div style={{ marginBottom: "20px" }}>
        <input
          placeholder="Enter Country"
          value={country}
          onChange={(e) => setCountry(e.target.value)}
        />

        <input
          placeholder="Enter Job Title"
          value={jobTitle}
          onChange={(e) => setJobTitle(e.target.value)}
          style={{ marginLeft: "10px" }}
        />

        <button onClick={handleCountryInsights} style={{ marginLeft: "10px" }}>
          Country Insights
        </button>

        <button onClick={handleJobInsights} style={{ marginLeft: "10px" }}>
          Job Insights
        </button>
      </div>

      {/* Error */}
      {error && <p style={{ color: "red" }}>{error}</p>}

      {/* Country Insights */}
      {countryData && (
        <div style={{ marginTop: "20px" }}>
          <h3>Country Insights</h3>
          <p>Min Salary: {countryData.min_salary}</p>
          <p>Max Salary: {countryData.max_salary}</p>
          <p>Avg Salary: {countryData.avg_salary}</p>
        </div>
      )}

      {/* Job Insights */}
      {jobData && (
        <div style={{ marginTop: "20px" }}>
          <h3>Job Title Insights</h3>
          <p>Avg Salary: {jobData.avg_salary}</p>
        </div>
      )}
    </div>
  );
}