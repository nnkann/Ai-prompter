const topic = process.argv.slice(2).join(" ").trim() || "your project";

const prompt = [
  "You are an expert AI prompt assistant.",
  `Create a clear, useful prompt for: ${topic}.`,
  "Include the goal, required context, output format, and quality criteria."
].join("\n");

console.log(prompt);

