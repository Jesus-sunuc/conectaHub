import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./App.tsx";
import "./assets/custom.scss";
import "bootstrap";
import "bootstrap-icons/font/bootstrap-icons.css";
import { BrowserRouter } from "react-router-dom";
import { ThemeProvider } from "./components/theme/ThemeProvider.tsx";
import { getQueryClient } from "./services/queryClient.tsx";
import { QueryClientProvider } from "@tanstack/react-query";
import { LoadingAndErrorHandling } from "./components/LoadingAndErrorHandling.tsx";

const queryClient = getQueryClient();

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <LoadingAndErrorHandling>
      <QueryClientProvider client={queryClient}>
        <ThemeProvider>
          <BrowserRouter>
            <App />
          </BrowserRouter>
        </ThemeProvider>
      </QueryClientProvider>
    </LoadingAndErrorHandling>
  </StrictMode>
);
