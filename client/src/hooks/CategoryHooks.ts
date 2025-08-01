import { useSuspenseQuery } from "@tanstack/react-query";
import type { CategoryBase } from "../models/Category";
import { axiosClient } from "../../utils/axiosClient";
// import { getQueryClient } from "../services/queryClient";

// const queryClient = getQueryClient();

export const categoryKeys = {
  all: ["categories"] as const,
};

export const useCategoryQuery = () => {
  return useSuspenseQuery({
    queryKey: categoryKeys.all,
    queryFn: async (): Promise<CategoryBase[]> => {
      const res = await axiosClient.get("/api/categories/all");
      return res.data;
    },
  });
};
